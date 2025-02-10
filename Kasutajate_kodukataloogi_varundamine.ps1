### Koosta skript, mis kontrollib kõikide kasutajate olemasolu süsteemis ja igale kasutajale loob tema kodukataloogi varundus, mille paigutad C:\Backup kausta. 
### Varunduse loomisel iga kasutaja kodukataloog peab olema varundatud nimega kasutajanimi - PP.MM.YYYY.zip. Testimiseks kõigepealt proovi varundada kõikide kasutajate kodukataloogid. 
### Siis vali üks kasutaja, kelle kodukataloogi sisu kustuta ära ja proovi lahti pakkida tema varundus ning kontrolli, kas kõik failid ja kaustad taastuvad või mitte.
### Vajadusel paranda ja täienda skripti.

#Loome varanduse kausta, kui seda juba thtud ei ole. 
$Varundus = "C:\Backup"
if (-Not (Test-Path $Varundus)) {
    New-Item -Path $Varundus -ItemType Directory
}

#Loome varunduse kõigi kasutajate kodukaustadest
$kasutajad = Get-ChildItem "C:\Users" -Directory
foreach ($kasutaja in $kasutajad) {
    $kasutajanimi = $kasutaja.Nimi
    $daatum = Get-Date -Format "dd.MM.yyyy"
    $kodukaust = "C:\Users\$kasutajanimi"
    $varundusefail = "$kasutajanimi-$daatum.zip"
    $teevarunduseni = Join-Path -Path $Varundus -ChildPath $varundusefail
    
    #Loome varunduse kõigi kasutajate kodukaustades
    Compress-Archive -Path $kasutaja.FullName -DestinationPath $teevarunduseni
  -Force
}

Write-Host "Kõigi kasutajate kodukaustad on varundatud asukohas $kodukaust."