#
# Script2.ps1
#

$url = "http://localhost:8218"
$inPath = "c:\del\description.txt"
$outPath = "c:\del\postResult.txt"
$userName = "user"
$password = "password"
if ($args.Length -lt 5)
{
	Write-Host "Usage Script2.ps1 <description_file> <result_file> <url> <userName> <password>"
	Write-Host "Description_File format"
	Write-Host "<id> <description>"
}
else
{
	$inPath = $args[0]
	$outPath = $args[1]
	$url = $args[2]
	$userName = $args[3]
	$password = $args[4]

	$loginResponse = Invoke-WebRequest ($url + "/user/login") -SessionVariable ws -UseBasicParsing
	$loginResponse
	$requestVerificationToken = ($loginResponse.InputFields | Where { $_.name -eq "__RequestVerificationToken" }).value
	$requestVerificationToken
	$loginParam = @{Name = $userName; Password = $password; "__RequestVerificationToken" = $requestVerificationToken;}

	Invoke-WebRequest -Uri ($url + "/user/login") -Method Post -Body $loginParam -WebSession $ws -UseBasicParsing

	#$ws.Cookies.GetCookies($url)[".ASPXAUTH"].ToString()

	$descrData = Get-Content $inPath
	foreach($line in $descrData)
	{
		$id, $description = $line.split(' ')
		$postParams = @{id = $id; description = $description}
		$postResult = Invoke-WebRequest -Uri ($url + "/person/updatedescription") -Method Post -Body $postParams -WebSession $ws -UseBasicParsing
		Add-Content $outPath $postResult.Content
	}
}