/*
CREATED BY SAMIRA ALVES LUCIO DIAS
DATE: 23/06/2020
GOAL: Report develop to return data as nursing news scale
*/

SELECT
      ATENDIME.CD_PACIENTE "Prontuário"
      ,ATENDIME.CD_ATENDIMENTO "Atendimento"
      ,PACIENTE.NM_PACIENTE "Nome do Paciente"
      ,ATENDIME.DT_ATENDIMENTO "Internação"
      ,UNID_INT.DS_UNID_INT "Unidade de Internação"
      ,LEITO.DS_LEITO "Leito"
      ,ITCOLETA_SINAL_VITAL.CD_COLETA_SINAL_VITAL "Coleta do Sinal Vital"
      ,COLETA_SINAL_VITAL.DATA_COLETA  "Data da Coleta"
      ,ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL "Código Sinal Vital"
      ,SINAL_VITAL.DS_SINAL_VITAL "Sinal Vital"
      ,ITCOLETA_SINAL_VITAL.VALOR "Registro"
      ,CASE
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =1 AND ITCOLETA_SINAL_VITAL.VALOR >= 39.1) THEN 2 -- TEMPERATURA 
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =1 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 38.1 AND 39) THEN 1 -- TEMPERATURA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =1 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 36.1 AND 38) THEN 0 -- TEMPERATURA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =1 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 35.1 AND 36) THEN 1 -- TEMPERATURA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =1 AND ITCOLETA_SINAL_VITAL.VALOR <= 35) THEN 3  -- TEMPERATURA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR >= 131) THEN 3 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 111 AND 130) THEN 2 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 91 AND 110) THEN 1 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 51 AND 90) THEN 0 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 41 AND 50) THEN 1 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =2 AND ITCOLETA_SINAL_VITAL.VALOR <= 40) THEN 3 -- FREQUÊNCIA CARDIACA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =3 AND ITCOLETA_SINAL_VITAL.VALOR >= 25) THEN 3 -- FREQUÊNCIA RESPIRATÓRIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =3 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 21 AND 24) THEN 2 -- FREQUÊNCIA RESPIRATÓRIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =3 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 12 AND 20) THEN 0 -- FREQUÊNCIA RESPIRATÓRIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =3 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 9 AND 11) THEN 1 -- FREQUÊNCIA RESPIRATÓRIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =3 AND ITCOLETA_SINAL_VITAL.VALOR <= 8) THEN 3 -- FREQUÊNCIA RESPIRATÓRIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =4 AND ITCOLETA_SINAL_VITAL.VALOR >= 220) THEN 3 -- PA SISTOLICA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =4 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 111 AND 219) THEN 0 -- PA SISTOLICA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =4 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 101 AND 110) THEN 1 -- PA SISTOLICA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =4 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 91 AND 100) THEN 2 -- PA SISTOLICA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =4 AND ITCOLETA_SINAL_VITAL.VALOR < 90) THEN 3 -- PA SISTOLICA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =26 AND ITCOLETA_SINAL_VITAL.VALOR >= 96) THEN 0 -- SATURAÇÃO
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =26 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 94 AND 95) THEN 1 -- SATURAÇÃO
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =26 AND ITCOLETA_SINAL_VITAL.VALOR BETWEEN 92 AND 93) THEN 2 -- SATURAÇÃO
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =26 AND ITCOLETA_SINAL_VITAL.VALOR <= 91) THEN 3 -- SATURAÇÃO
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =221 AND ITCOLETA_SINAL_VITAL.VALOR > 0) THEN 2 -- OXIGENOTERAPIA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =141 AND ITCOLETA_SINAL_VITAL.VALOR > 0) THEN 0 -- CONSCIÊNCIA/ALERTA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =142 AND ITCOLETA_SINAL_VITAL.VALOR > 0) THEN 1 -- CONSCIÊNCIA/CONFUSA
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =143 AND ITCOLETA_SINAL_VITAL.VALOR > 0) THEN 2 -- CONSCIÊNCIA/RESP. A DOR
        WHEN (ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL =144 AND ITCOLETA_SINAL_VITAL.VALOR > 0) THEN 3 -- CONSCIÊNCIA/INCONSCIENTE
        
        
      END SCORE
FROM  ATENDIME ATENDIME
INNER JOIN PACIENTE PACIENTE
  ON ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
INNER JOIN LEITO LEITO
ON ATENDIME.CD_LEITO = LEITO.CD_LEITO
INNER JOIN UNID_INT UNID_INT
  ON UNID_INT.CD_UNID_INT = LEITO.CD_UNID_INT
INNER JOIN COLETA_SINAL_VITAL COLETA_SINAL_VITAL
  ON ATENDIME.CD_ATENDIMENTO = COLETA_SINAL_VITAL.CD_ATENDIMENTO
INNER JOIN ITCOLETA_SINAL_VITAL ITCOLETA_SINAL_VITAL
  ON COLETA_SINAL_VITAL.CD_COLETA_SINAL_VITAL = ITCOLETA_SINAL_VITAL.CD_COLETA_SINAL_VITAL
INNER JOIN SINAL_VITAL SINAL_VITAL
  ON SINAL_VITAL.CD_SINAL_VITAL = ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL
WHERE ATENDIME.CD_MULTI_EMPRESA = '3'
AND ITCOLETA_SINAL_VITAL.CD_SINAL_VITAL = 1
AND ITCOLETA_SINAL_VITAL.VALOR != 0 
AND ITCOLETA_SINAL_VITAL.VALOR IS NOT NULL
AND   COLETA_SINAL_VITAL.DATA_COLETA BETWEEN TO_DATE ('20.02.2020 00:00:00', 'DD.MM.YYYY HH24:MI:SS')
                             AND TO_DATE('21.02.2020 00:00:00', 'DD.MM.YYYY HH24:MI:SS')
--AND COLETA_SINAL_VITAL.DATA_COLETA BETWEEN TO_CHAR(COLETA_SINAL_VITAL.DATA_COLETA,'DD//MM/YYYY') = '21/06/2020' AND TO_CHAR(COLETA_SINAL_VITAL.DATA_COLETA,'DD//MM/YYYY') = '22/06/2020'
ORDER BY COLETA_SINAL_VITAL.DATA_COLETA
;


AND   SOLSAI_PRO.DT_IMPRESSAO BETWEEN TO_DATE ('21.01.2020 00:00:00', 'DD.MM.YYYY HH24:MI:SS')
                             AND TO_DATE('20.02.2020 00:00:00', 'DD.MM.YYYY HH24:MI:SS')


