# Test-xmldiffpatch.ps1
# This code need to download Microsoft tool
# https://msdn.microsoft.com/en-us/library/aa302294
# or Nuget
# https://www.nuget.org/packages/XMLDiffPatch/

# Load the DLL
Add-Type -Path "C:\Program Files (x86)\XmlDiffPatch\Bin\xmldiffpatch.dll"

$xmlD1=[XML](Get-Content 'd:\temp\M1.xml')
$xmlD2=[XML](Get-Content 'd:\temp\M2.xml')
$xmlWriter = [System.Xml.XmlWriter]::Create("d:\temp\M3.xml")

$xmlDiff= New-Object Microsoft.XmlDiffPatch.XmlDiff
$xmlDiff.IgnorePrefixes=$true
$xmlDiff.IgnoreChildOrder=$true
$xmlDiff.IgnoreNamespaces=$true

$blIdentical = $xmldiff.Compare($xmlD1, $xmlD2, $xmlWriter);
$blIdentical
$xmlWriter.Close();