$eesnimi = Read-Host "Palun sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Palun sisesta kasutaja perekonnanimi"

$kasutajanimi = $eesnimi.ToLower() + "." + $perekonnanimi.ToLower()

Write-Host "$kasutajanimi läheb süsteemist eemaldamisele."

try {
Remove-LocalUser -Name $kasutajanimi -Erroraction Stop

Write-Host "Kasutaja $kasutajanimi on edukalt eemaldatud."
} catch {
    Write-Host "Kahjuks on tekkinud segadus $kasutajanimi eemaldamisega. Error: $_"
}