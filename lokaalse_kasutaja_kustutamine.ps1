$eesnimi = Read-Host "Palun sisesta oma eesnimi "
$perekonnanimi = Read-Host "Palun sisesta oma perekonnanimi "

$kasutajanimi = $eesnimi.ToLower() + "." + $perekonnanimi.ToLower()

Write-Host "Süsteemist eemldatava kasutajanimi on" $kasutajanimi

$kasutajaeksisteerib = Get-LocalUser $kasutajanimi -ErrorAction SilentlyContinue

if ($kasutajaeksisteerib) {
    Remove-LocalUser -Name $kasutajanimi -ErrorAction Stop
    Write-Host "$kasutajanimi on edukalt kustutatud."
} else {
    Write-Host "Error: $kasutajanimi ei leitud."
}