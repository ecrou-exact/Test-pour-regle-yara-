rule APT_MAL_Win_BlueLight : InkySquid {
    meta:
        author = "threatintel@volexity.com"
        date = "2021-04/23"
        description = "The BLUELIGHT malware family. Leverages Microsoft OneDrive for network communications."
        hash1 = "7c40019c1d4cef2ffdd1dd8f388aaba537440b1bffee41789c900122d075a86d"
        hash2 = "94b71ee0861cc7cfbbaee53ad2e411a76f296fd5684edf6b25ebe79bf6a2a600a"
        license = "See license at https://github.com/volexity/threat-intel/LICENSE.txt"
        reference = "https://www.volexity.com/blog/2021/08/17/north-korean-apt-inkysquid-infects-victims-using-browser-exploits/"
        id = "3ec2d44c-4c08-514d-a839-acef3f53f7dc"
    strings:
        $pdb1 = "\\Development\\BACKDOOR\\ncov\\"
        $pdb2 = "Release\\bluelight.pdb"

         = "https://ipinfo.io" fullword
        $msg1 = "country" fullword
        $msg5 = "\"UserName\":\"" fullword
        $msg7 = "\"ComName\":\"" fullword
        $msg8 = "\"OS\":\"" fullword
        $msg9 = "\"OnlineIP\":\"" fullword
        $msg10 = "\"LocalIP\":\"" fullword
        $msg11 = "\"Time\":\"" fullword
        $msg12 = "\"Compiled\":\"" fullword
        $msg13 = "\"Process Level\":\"" fullword
        $msg14 = "\"AntiVirus\":\"" fullword
        $msg15 = "\"VM\":\"" fullword

    condition:
        any of ($pdb*) or 
        all of ($msg*) 
}
