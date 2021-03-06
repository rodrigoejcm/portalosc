DROP FUNCTION IF EXISTS portal.inserir_token_usuario(idusuario INTEGER, token TEXT, dataexpiracao DATE);

CREATE OR REPLACE FUNCTION portal.inserir_token_usuario(idusuario INTEGER, token TEXT, dataexpiracao DATE) RETURNS BOOLEAN AS $$

DECLARE
	status BOOLEAN;

BEGIN
	IF (SELECT EXISTS(SELECT true FROM portal.tb_token WHERE tb_token.id_usuario = id_usuario)) THEN 
		DELETE FROM portal.tb_token 
		WHERE tb_token.id_usuario = idusuario;
	END IF;

	INSERT INTO portal.tb_token(id_usuario, tx_token, dt_data_expiracao_token) 
	VALUES (idusuario, token, dataexpiracao);

	status := true;
	RETURN status;

EXCEPTION 
	WHEN others THEN 
		status := false;
		RETURN status;

END;
$$ LANGUAGE 'plpgsql';
