#INCLUDE 'totvs.ch'

#DEFINE NMAXA 10
#DEFINE NMAXB 15
#DEFINE NMAXC 25

User Function L05E10()
    local aA   := {}
    local aB   := {}
    local aC   := {}
    local cMsg := ""
    local nI, nJ, nK, nPos := 0

    for nI := 1 to NMAXA
        Aadd(aA, nI)
    next

    for nJ := NMAXB to 1 step - 1
        Aadd(aB, nJ)
    next

    for nK := 1 to NMAXC
        if nK <= NMAXA
            Aadd(aC, aA[nK])
            cMsg += cValToChar(aC[nK]) + ", "
        else 
            nPos++
            Aadd(aC, aB[nPos])
            cMsg += cValToChar(aC[nK]) + ", "
        endif 
    next
    
    cMsg += CRLF + CRLF + "Esse é o tamanho do array C: " + cValToChar(Len(aC))

    FwAlertInfo(cMsg, "Soma de Vetores")
    
Return 
