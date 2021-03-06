DROP FUNCTION IF EXISTS portal.obter_osc_financiador_projeto(param INTEGER);

CREATE OR REPLACE FUNCTION portal.obter_osc_financiador_projeto(param INTEGER) RETURNS TABLE (
	id_financiador_projeto INTEGER, 
	tx_nome_financiador TEXT, 
	ft_nome_financiador TEXT
) AS $$ 
BEGIN 
	RETURN QUERY 
		SELECT 
			vw_osc_financiador_projeto.id_financiador_projeto, 
			vw_osc_financiador_projeto.tx_nome_financiador, 
			vw_osc_financiador_projeto.ft_nome_financiador 
		FROM 
			portal.vw_osc_financiador_projeto 
		WHERE 
			vw_osc_financiador_projeto.id_projeto = param;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';
