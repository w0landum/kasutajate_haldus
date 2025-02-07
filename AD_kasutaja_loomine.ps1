#AD kasutajakontode asukoht
$fail = "C:\Users\User\ps_skriptimine\kasutajate_haldus\kasutajad.csv"
#Impordime sisu
$kontod = Import-Csv $fail -EnCoding Default -Delimiter ";"
#ridade kaupa
foreach ($konto in $kontod){
    $kasutajanimi = $konto.Eesnimi + "." + $konto.Perekonnanimi
    $kasutajakonto = $kasutajanimi.ToLower()
    echo $kasutajakonto
}
#Translitereerime täpitähed tavatähtedeks
function Trans {
    param(
        [string] $tyhi
    )
    #Ainult täpitähed
        $Trans = @{
        [symbol]"õ" = "ee"
        [symbol]"ä" = "ae"
        [symbol]"ö" = "oa"
        [symbol]"ü" = "ue"
        }
    $t2is
    #Muudame sõne sümbolite reaks
    foreach ($symbol in $tyhi = $tyhi.ToCharArray())
    {
        #Kui sümbol on täpitäht
        if ($trans[$symbol] -cne $Null){
            #lisa täpitähtede väljundisse
            $t2is += $Trans[$symbol]
        } else {
            #Jätame vahele ja lisame tavatähe
            $t2is += $symbol
        }
    }
    Write-Output $t2is
}