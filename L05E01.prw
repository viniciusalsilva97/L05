#INCLUDE 'totvs.ch'

User Function L05E01()
    local aSemana := {}
    local nNumero := Randomize(1, 7)

    Aadd(aSemana, nNumero) 
    
    if aSemana[1] == 1
        FwAlertInfo("Domingo", "Dia da Semana")
    elseif aSemana[1] == 2
        FwAlertInfo("Segunda", "Dia da Semana")
    elseif aSemana[1] == 3
        FwAlertInfo("Ter�a", "Dia da Semana")
    elseif aSemana[1] == 4
        FwAlertInfo("Quarta", "Dia da Semana")
    elseif aSemana[1] == 5
        FwAlertInfo("Quinta", "Dia da Semana")
    elseif aSemana[1] == 6
        FwAlertInfo("Sexta", "Dia da Semana")
    elseif aSemana[1] == 7
        FwAlertInfo("S�bado", "Dia da Semana")
    endif
    
Return 
