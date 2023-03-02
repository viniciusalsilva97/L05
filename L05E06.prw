#INCLUDE 'totvs.ch'

#DEFINE NMAXA 10
#DEFINE NMAXB 10
#DEFINE NMAXC 10

User Function L05E06()
    local aA    := {}
    local aB    := {}
    local aC    := {}
    local cMsg  := ""
    local nI    := 0
    local nJ    := 0
    local nK    := 0
    local nPos  := 0
    local nNum  := 0
    local lColB := .f.

    for nI := 1 to NMAXA
        nNum := Randomize(1, 50)
        Aadd(aA, nNum)
    next

    for nJ := NMAXB to 1 step - 1
        nNum := Randomize(100, 150)
        Aadd(aB, nNum)
    next

    for nK := 1 to NMAXC
        lColB := nK % 2 == 0
        if lColB
            Aadd(aC, aB[nK])
            nPos++
            cMsg += cValToChar(aC[nPos]) + ", "
        else
            Aadd(aC, aA[nK])
            nPos++
            cMsg += cValToChar(aC[nPos]) + ", "
        endif 
    next

    FwAlertInfo(cMsg, "Novo vetor C")
    
Return 
