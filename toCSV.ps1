
$allVals = ''
$cnt = 3
$fileName = 'data.csv'
$pwd = '' + (Get-Location) + "\" + $fileName

if (test-path $pwd) {
    write-host "`nThere is already $fileName file in current directory"
    write-host "By default its going to be replaced by new sets of data"
    write-host "Move/rename old file or else you will lose its content`n"
    read-host -prompt "Enter to proceed"
}

try {
    function get-vals {
        for ($i = 1; $i -le $cnt; $i++) {
            $input = Read-Host -Prompt "Enter value no. $i"
            $vals += $input + '	'
            if ($i -eq $cnt) {
            $vals += "`n"
            }
        }
        return $vals
    }

    while ($true) {
    
        $allVals += get-vals
        $allVals | out-file -filepath $fileName

        $yesNo = read-host -Prompt "Press [q] to quit or Enter to type more data"
        if ($yesNo -eq 'q' -or $yesNo -eq 'Q') {
            write-host "Data exported to $pwd"
            $allVals = ''
            break
        }
        else {
            write-host "Type new set of data"
            continue
        }
    }
}

finally {
    #write-host "`nQuitting without saving last dataset"
}
