# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

'George Bisset,Donald Frush,Erik Paulson,Barbara Hertzberg,Elmar Merkle,Rendon Nelson,William Thompson,Richard Leder,Daniel Boll,Tracy Jaffe,Sujata Ghate,Lisa Ho,Clare Haystead,Chad Miller,Amy Neville,Rajan Gupta,Jay Baker,Mary Scott Campbell Soo,Ruth Walsh,Sora Yoon,Karen Johnson,Connie Kim,Clyde Helms,Charles Spritzer,Lee Cothran,Emily Vinson,James Provenzale,Daniel Barboriak,James Eastwood,David Enterline,Linda Gray,Jeffrey Petrella,Ramsey Kilani,Jenny Hoang,Peter Kranz,Edward Coleman,Michael Hanson,Salvador Borges-Neto,Bennett Chin,Charles Maxfield,Caroline Carrico,Caroline Hollingsworth,Ana Maria Gaca,Page McAdams,Philip Goodman,Edward Patz,Carl Ravin,Lacey Washington,Laura Heyneman,Lynne Hurwitz,Margaret Williford,Santiago Martinez,Jared Christensen,Tony Smith,Paul Suhocki,Michael Miller,Charles Kim'.split(',').each do |f|
  Faculty.create(:name=>f.strip)
end