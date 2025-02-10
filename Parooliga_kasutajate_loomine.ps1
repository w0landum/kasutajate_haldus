$eesnimi = Read-Host "Palun sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Palun sisesta kasutaja perekonnanimi"

$kasutajanimi = $eesnimi.ToLower() + "." + $perekonnanimi.ToLower()

$Parool = Read-Host "Palun sisesta oma parool"

$liiguta = "Kasutaja " + $kasutajanimi + " parool on " + $Parool + "."

$liiguta | Out-File -FilePath C:\Users\Roland\Documents\ps_skript\kasutajanimi.csv

Write-Host "Kasutajatunnus koos parooliga on lisatud faili." -ForegroundColor Green