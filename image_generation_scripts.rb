img = Magick::Image::read("blabber/background_full.png").first

(1..650).each do |num|
    cropped = img.crop(0 + num, 0, 640, 776, true)
    cropped.write("blabber/bg#{num}.png"){ self.quality = 100 }
    puts "wrote slice #{num}"
end


(1..650).each do |num|
    puts "[UIImage imageNamed:@\"bg#{num}.png\"],"
end