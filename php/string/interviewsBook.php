<?php

# 1.4 page 91
function palindromeCheck(string $string)
{
    $arr = str_split($string);
    $len = count($arr);
    if ($len === 0) {
        return false;
    }

    $hash = [];
    $oddCount = 0;
    for ($i = 0; $i < $len; $i++) {
        $letter = $arr[$i];
        if ($letter === ' ') {
            continue;
        }

        $letter = strtolower($letter);
        $hash[$letter] = isset($hash[$letter]) ? $hash[$letter] + 1 : 1;
        if ($hash[$letter] % 2 == 1) {
            $oddCount += 1;
        } else {
            $oddCount -= 1;
        }
    }

    return $oddCount > -1 && $oddCount < 2;
}

//var_dump(palindromeCheck('aa a bb') === true);
//var_dump(palindromeCheck('a a b b') === true);
//var_dump(palindromeCheck('aa bbccc') === true);
//var_dump(palindromeCheck('aa bbb ccc') === false);
//var_dump(palindromeCheck('Tact Coa') === true);


# 1.5 page 91
function checkOneEdit(string $strBefore, string $strAfter)
{
    $arrBefore = str_split($strBefore);
    $lenBefore = count($arrBefore);
    $arrAfter = str_split($strAfter);
    $lenAfter = count($arrAfter);

    $changes = 0;
    $maxLen = $lenBefore > $lenAfter ? $lenBefore : $lenAfter;
    for ($i = 0; $i < $maxLen; $i++) {
        $letter = $arrBefore[$i];
        $hash[$letter] = isset($hash[$letter]) ? $hash[$letter] + 1 : 1;
    }
    for ($i = 0; $i < $lenAfter; $i++) {
        $letter = $arrAfter[$i];
        $hash[$letter] = isset($hash[$letter]) ? $hash[$letter] - 1 : -1;
    }
    foreach ($hash as $k => $v) {
        if ($v !== 0) {
            $changes += 1;
        }
    }

    return $changes <= 1;
}
var_dump(checkOneEdit('pale', 'ple') === true);
var_dump(checkOneEdit('pales', 'pale') === true);
var_dump(checkOneEdit('pale', 'bale') === true);
var_dump(checkOneEdit('pale', 'bake') === false);
