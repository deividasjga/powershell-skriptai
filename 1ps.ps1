do
 {
    $menu=@"
1. sukurti txt faila su sistemos errorais
2. istrinti txt is 1
3. Surasti faila
Q. Iseiti
Spausti Q, kad iseiti.
"@
Write-Host "`n Meniu`n" -ForegroundColor Cyan
$ans = Read-Host $menu
    switch ($ans)
    {
     '1' {
    'Pasirinkta 1. Prasome palaukti.'
    # Gaunami sources, kurie gamina errorus. Sugrupuojami Source ir neberodome Group rezultatu su -NoElement.
    Get-EventLog System -Entry Error | group Source -NoElement | sort Count -Descending |  #Rikiuojama pagal Count mažėjimo tvarka
    Format-Table -Autosize |   # Išveda pilnus rezultatus, be sutrumpinimų
    Out-File .\1rez.txt
    Write-Host `nSukurtas failas -Foreground Green
    }
     '2'{'Pasirinkta 2.' 
     Write-Host Istrinamas 1rez.txt -ForegroundColor Yellow
         rm 1rez.txt   #ištrinamas failas
    }
     '3' {
      'Pasirinkta 3.'
    #path ir term yra įvedami į kintamuosius.
$path=Read-Host -prompt "Enter path: "
$term=Read-Host -prompt "Enter a term: "
Write-Host "Surasta:"
function Ieskoti($FilePath, $SearchTerm) {
    #gaunamas failu ir aplanku sąrašas 
    $dir1 = Get-ChildItem -Path $FilePath
    foreach ($dir2 in $dir1) {
        $name = $dir2.Name
        #išvedama, kas atitinka įvestą frazę esamame aplankale
        if ($name -match $SearchTerm) {
            Write-Host "$FilePath\$name"
        }
        #išvedama, kas atitinka įvestą frazę sekančiuose aplankaluose
        $yraDir = Test-Path -Path "$FilePath\$name" -PathType Container
        if ($yraDir) {
            Search-Folder -FilePath "$FilePath\$name" -SearchTerm $SearchTerm
        }
    }
} # Ieskojimo funkcija
Ieskoti -FilePath $path -SearchTerm $term
}
       'q'{}
        default{Write-Host "`n[X] blogas pasirinkimas" -ForegroundColor Red}
 }}
 until ($ans -eq 'q')