function Set-Eilute
{
<#
	.Synopsis
	
    Funkcija konvertuoja ivestos eilutes raides i didziasias,mazasias.
	
	.DESCRIPTION
       
    Funkcija konvertuoja ivestos eilutes raides i didziasias,mazasias arba padaro pirmasias eilutes zodziu raides didiosiomis.
	
	.PARAMETER StringToConvert

    Ivesta eilute, kuri bus pakeista.
	
	.PARAMETER Mazosios

    Konvertuoja visus eilutes simbolius i mazuosius.
	
	.PARAMETER Didziosios

    Konvertuoja	visus eilutes simbolius i didziuosius simbolius

	.PARAMETER Dpirma

    Konvertuoja pirmasias eilutes zodziu raides didziosiomis.
	
	.EXAMPLE

    PS C:\> Set-Eilute -StringKon "vardenis pavardenis" -Didziosios

    VARDENIS PAVARDENIS

    .EXAMPLE

    PS C:\> Set-Eilute -StringKon "VARDenis paVardeNIS" -Mazosios

    vardenis pavardenis

    .EXAMPLE

    PS C:\> Set-Eilute -StringKon "VARDenis paVardeNIS" -Dpirma

    Vardenis Pavardenis
	
#>
	
	[CmdletBinding(DefaultParameterSetName = 'Dpirma')]
	[OutputType([string], ParameterSetName = 'Dpirma')]
	[OutputType([string], ParameterSetName = 'Mazosios')]
	[OutputType([string], ParameterSetName = 'Didziosios')]
	[OutputType([string])]
	param
	(
		[Parameter(ParameterSetName = 'Mazosios',
				   Mandatory = $true)]
		[Parameter(ParameterSetName = 'Dpirma')]
		[Parameter(ParameterSetName = 'Didziosios',
				   Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[Alias('String', 'Characters')]
		[string]
		$StringKon,
		[Parameter(ParameterSetName = 'Mazosios')]
		[switch]
		$Mazosios,
		[Parameter(ParameterSetName = 'Didziosios')]
		[switch]
		$Didziosios,
		[Parameter(ParameterSetName = 'Dpirma')]
		[switch]
		$Dpirma
	)
	
	switch ($PsCmdlet.ParameterSetName)
	{
		'Mazosios'
		{
			[string]$returnString = $StringKon.ToLower()
			
			return $returnString
			
			break
		}
		'Didziosios'
		{
			[string]$returnString = $StringKon.ToUpper()
             return $returnString			

			break
		}
		'Dpirma'
		{
    if ($StringKon.IndexOf(" ") -ne "-1")
	    {
		
	    	$Eil1 = $StringKon.Split(" ")
		
		    $Eil2 = @()
		
		    foreach ($mEil in $Eil1)
		    {
		    	$mEil = "$((($mEil).Trim()).ToUpper().Substring(0, 1))$((($mEil).Trim()).ToLower().Substring(1))"
			    $Eil2 += $mEil
		    }
		    
		    [string]$Pataisyta = $Eil2
		    Return $Pataisyta
	    }
	    else
	    {
		    $mEil = "$((($StringKon).Trim()).ToUpper().Substring(0, 1))$((($StringKon).Trim()).ToLower().Substring(1))"
		    [string]$Pataisyta = $mEil
		    Return $Pataisyta
	    }
		    	break
		    }
	    }
}
