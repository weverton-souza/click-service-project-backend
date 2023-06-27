CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "address" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(50),
    neighborhood VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN "address".id IS 'ID único para o endereço, gerado automaticamente';
COMMENT ON COLUMN "address".street IS 'Nome da rua';
COMMENT ON COLUMN "address".number IS 'Número da residência';
COMMENT ON COLUMN "address".complement IS 'Complemento para o endereço, se houver';
COMMENT ON COLUMN "address".neighborhood IS 'Nome do bairro';
COMMENT ON COLUMN "address".city IS 'Nome da cidade';
COMMENT ON COLUMN "address".state IS 'Nome do estado';
COMMENT ON COLUMN "address".postal_code IS 'Código postal (CEP)';
COMMENT ON COLUMN "address".verified IS 'Indica se o endereço foi verificado';
COMMENT ON COLUMN "address".created_at IS 'Data e hora da criação do endereço';
COMMENT ON COLUMN "address".updated_at IS 'Data e hora da última atualização do endereço';
