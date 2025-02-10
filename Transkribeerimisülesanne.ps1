#Translitereerime täpitähed tavatähtedeks
function Trans {
    param(
        [array] $sisend
    )
    #Ainult täpitähed
        $Trans = @{
        [char]"õ" = "e"
        [char]"ä" = "e"
        [char]"ö" = "o"
        [char]"ü" = "u"
        }
    $l6pp = ""
    #Muudame sõne sümbolite reaks
    foreach ($t2ht in $sisendit2ht = $sisend.ToCharArray())
    {
        #Kui sümbol on täpitäht
        if ($Trans[$t2ht] -cne $Null){
            #Lisame täpitähtede väljundisse
            $l6pp += $Trans[$t2ht]
        } else {
            #Jätame vahele ja lisame tavatähe
            $l6pp += $t2ht
        }
    }
    Write-Output $l6pp
}

#AD kasutajakontode asukoht
$fail = "C:\Users\Roland\Documents\ps_skript\kasutajad2.csv"
#Impordime sisu.
$kontod = Import-Csv $fail -EnCoding Default -Delimiter ";"
#Loome tühja järjendi.
$kasutajad = ""
#Eraldame kasutajanimed üksteisest komadega.
$korduvad = @($korduvad -join ",")

#Otsime ridade kaupa.
foreach ($konto in $kontod){
    #Loome konto nime jaoks sobiliku vormi.
    $kasutajanimi = $konto.Eesnimi.ToLower() + "." + $konto.Perekonnanimi.ToLower()
    #Lisame selle kasutajate tühja järjendisse.
    $kasutajad += $kasutajanimi

    #Loome isikunime kuvamise jaoks sobiliku vormi.
    $punktita = $konto.Eesnimi, $konto.Perekonnanimi
    $korduvad += $punktita

    #Kontrollime, kas järjendis on nimesid, mida esineb rohkem kui üks kord.
    if($korduvad | Group-Object | Where-Object Count -gt 1 | Select-Object){
        Write-Host "Vabandust, mure uue kasutajaga - kasutaja on juba olemas."
        #Jätkame hoolimata veateatest
        Continue
    } else {
        foreach ($konto in $kasutajad){
            #Teatame esmalt kasutaja kodanikunime ja seejärel töötleb funktsioon selle ümber ilma täpitähtede ja punktita nimekujuks.
            echo $punktita
            Write-Host "Süsteemis transkribeeritud ja väikeste tähtedega:" -ForegroundColor Green
            #Kutsume funktsiooni välja
            Trans($kasutajanimi)
            echo `n
        }
    }   
}