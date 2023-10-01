

file_names = Dir["*"]

if file_names.include?('compressed')
  file_names.delete('compressed')
end
puts file_names.count
Dir.mkdir('compressed') unless File.exists?('compressed')

file_names.each do |file_name|
  system("ffmpeg -i #{file_name} -c:v dnxhd -profile:v dnxhr_sq -c:a pcm_s16le compressed/#{file_name}")
end
