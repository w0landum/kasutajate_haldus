$eesnimi = Read-Host "Palun sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Palun sisesta kasutaja perekonnanimi"

$kasutajanimi = $eesnimi.ToLower() + "." + $perekonnanimi.ToLower()

#Kontrollime, kas kasutaja on juba ActiveDirectory's olemas või mitte,
$kasutajaeksisteerib = Get-ADUser -Filter {SameAccountName -eq $kasutajanimi}

if ($kasutajaeksisteerib){
    Write-Host "Kasutaja '$kasutajanimi' on juba AD-s olemas."
} else {
    #Proovime lisada kasutaja AD-sse,
    try {
        New-ADUser -Name "$eesnimi $perekonnanimi" 
        -SameAccountName $kasutajanimi -UserPrincipalName  "$kasutajanimi@domain.local" -Description "Kasutaja: $eesnimi $perekonnanimi"
        -AccountPassword (ConvertTo-SecureString "Parool1!" -AsPlainText -Force)
        Write-Host "Kasutaja '$kasutajanimi' on edukalt lisatud Active Directory'sse."
    }
    catch {
        Write-Host "Kasutaja lisamine ebaõnnestus. 
        Ehk on viga selles, et sinu arvutis ei ole Active Directory't. 
        Vajadusel paigalda see. 
        Viga: $_" -ForegroundColor Red
    }
}