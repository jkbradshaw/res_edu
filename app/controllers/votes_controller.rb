require 'faster_csv'

class VotesController < ApplicationController
  
  def new
    @faculty = Faculty.all
    @faculty.sort! {|a,b| a.name.split(' ').last <=> b.name.split(' ').last }
    #@faculty = @faculty[1..5]
  end
  
  def create
    return unless params[:submission]
    @ip = request.remote_addr
    @s = Submission.create(:ip => @ip)
    submission = JSON.parse(params[:submission])
    submission.each do |points,ids|
      ids.each do |id|
        Vote.create({:faculty_id=>id, :points=>points, :submission=>@s})
      end
    end
      
    respond_to do |format|
      format.js 
    end
  end
  
  def totals
    @faculty = Faculty.all
    @faculty.sort! {|a,b| a.name.split(' ').last <=> b.name.split(' ').last }
    @submission_no = Submission.all.count
    
    respond_to do |format|
      format.html
      format.csv do
        report = FasterCSV.generate do |csv|
          csv << ['Name', 'Total', 'Average']
          @faculty.each do |f|
            csv << [f.name, f.total_score.to_s, f.average.to_s]
          end
        end
        
        filename = 'report.csv'
        send_data(report, :type=> 'text/csv; charset=utf-8; header=present', :filename=>filename )   
      end
    end
  end
  
  
  
end
