#INCLUDE 'totvs.ch'

#DEFINE NMAXA 15

User Function L05E07()
    local aA       := {}
    local aB       := {}
    local cVetA    := ""
    local cVetB    := ""
    local nI       := 0
    local cAux     := 0 
    local nPos     := 0

    for nI := 1 to NMAXA
        Aadd(aA, nI)
        cVetA += cValToChar(aA[nI]) + ", "
    next

    for nI := NMAXA to 1 step - 1
        cAux := cValToChar(aA[nI])
        Aadd(aB, cAux)
        nPos++
        cVetB += cValToChar(aB[nPos]) + ", "
    next

    FwAlertInfo(cVetA + CRLF + CRLF + cVetB, "Vetor A e o seu Inverso Vetor B")
    
Return 
