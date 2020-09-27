$src_path = 'C:\test\src.odt'
$dst_path = 'C:\test\dst.odt'
$working_dir_path = 'C:\test\working'

Expand-Archive -Path $src_path -DestinationPath $working_dir_path


# Your ODF file is unzipped in the working directory
# Do whatever you want here, such as modifying content.xml


$mimetype_path = Join-Path -Path $working_dir_path -ChildPath 'mimetype'
$unzipped_path = Join-Path -Path $working_dir_path -ChildPath '*'

Compress-Archive -Path $mimetype_path -DestinationPath $dst_path -CompressionLevel NoCompression
Remove-Item -Path $mimetype_path
Compress-Archive -Path $unzipped_path -DestinationPath $dst_path -Update
