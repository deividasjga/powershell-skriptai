# powershell-skriptai

Apie 1:
  Paleidus scenarijų, gaunamas meniu su keliais pasirinkimais, kuriuos galima pasirinkti įvedus nurodytą simbolį (1, 2, 3 ir Q):
  1. Į txt failą išveda sistemos errorus, kurie sources ir po kiek jie kuria errorų sistemoje mažėjimo tvarka.
  2. Ištrina pirmo pasirinkimo sukurtą txt failą.
  3. Suranda ir išvardija visus failus ir aplankalus, kurie turi įvestą pavadinimą ir kurie yra nurodytame path ir jo aplankaluose. Išvedamas visas path.
  Q. Išėjimas iš programos.


Apie 2:
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
