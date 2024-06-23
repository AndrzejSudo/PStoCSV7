
$cnt = 3
$fileName = 'data.csv'
$deli = '	'
$flag = ''
$pwd = '' + (Get-Location) + "\" + $fileName

try {
    if (test-path $pwd) {
        write-host "`nThere is already '$fileName' file in current directory"
        $flag = read-host -prompt "If you want to merge new data with old, type [m] and if you want to replace it hit [Enter]"
        if ($flag -ne 'm' -or $flag -ne 'M') {
                remove-item -path $fileName
            }
    }

    function get-vals {
        for ($i = 1; $i -le $cnt; $i++) {
            $input = Read-Host -Prompt "Enter value no. $i"
            $vals += $input + '	'
            if ($i -eq $cnt) {
            }
        }
        return $vals
    }

    while ($true) {
        
        get-vals | out-file -filepath $filename -append
        $yesNo = read-host -Prompt "Press [q] to quit or press [Enter] to type more data"
        if ($yesNo -eq 'q' -or $yesNo -eq 'Q') {
            write-host "Data exported to $pwd"
            exit
        }
        else {
            write-host "Type new set of data"
            continue
        }
    }
}

catch [System.IO.IOException] {
    write-host "File already in use"
}
<#
catch [someFutureErrors] {
} 
#>
finally {
    write-host "`nQuitting"
}
