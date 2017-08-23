#
# Script1.ps1
#
[System.XML.XMLDocument]$xmlDoc = New-Object System.XML.XMLDocument
$nodecounts = New-Object System.Collections.Generic.List[string]

function parceNode($node)
{
	if ($node.HasChildNodes)
    {
		$nodecounts.Add($node.Name)
        foreach ($child in $node.ChildNodes)
        {                    
            parceNode($child);
        }
	}
    else
	{
		$nodecounts.Add($node.Name)
	}
}


$xmlPath = "c:\del\in.xml"

if ($args.Length -lt 1)
{
    Write-Host "Usage Script.ps1 <path_to_xml>"	
}
else
{
	$xmlPath = $args[0]

	$xmlDoc.Load($xmlPath)

	parceNode($xmlDoc)
	$nodecounts.RemoveAt(0) # #document

	$nodecounts | group | Sort-Object Count -Descending | Select-Object Name, Count
}