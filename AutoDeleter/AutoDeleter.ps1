# Define the parent directory path
$parentDirectory = "C:\Users\Admin\Desktop\Soft-Uni DB\EntityFrameWork\06.Quering\05.Advanced-Querying-Exercises-BookShop-6.0"
# Ensure the path exists
if (Test-Path -Path $parentDirectory) {
# Get all 'bin' and 'obj' directories recursively within the parent directory
$directories = Get-ChildItem -Path $parentDirectory -Directory -Recurse | Where-Object { $_.Name -match "^(bin|obj)$" }
foreach ($dir in $directories) {
try {
# Remove the directory and its contents
Remove-Item -Path $dir.FullName -Recurse -Force
Write-Host "Deleted: $($dir.FullName)"
} catch {
Write-Host "Failed to delete: $($dir.FullName) - $($_.Exception.Message)"
}
}
} else {
Write-Host "The specified parent directory does not exist: $parentDirectory"
}