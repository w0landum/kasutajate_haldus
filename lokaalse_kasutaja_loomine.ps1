$eesnimi = Read-Host "Palun sisesta oma eesnimi "
$perekonnanimi = Read-Host "Palun sisesta oma perekonnanimi "

$kasutajanimi = $eesnimi.ToLower() + "." + $perekonnanimi.ToLower()
$parool = "Parool1!"
$täisnimi = $eesnimi, $perekonnanimi
$kirje = "Lokaalne kasutaja"

Write-Host "Loodav kasutajanimi on" $kasutajanimi

$kasutajaeksisteerrib = Get-LocalUser $kasutajanimi -ErrorAction SilentlyContinue

if(($kasutajanimi | Select Name).Name.Count -ge 1){
    Write-Host "Ei ole võimalik kasutajat luua - sama nimega konto on juba kasutuses."
    Exit
}else {
    echo "Teie kasutajanimi: " $kasutajanimi "Teie parool: " $parool "Teie täisnimi: " $täisnimi "Teie kasutajatüüp: " $kirje
}