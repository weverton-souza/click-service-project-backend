CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TYPE IF EXISTS UserType;
CREATE TYPE UserType AS ENUM ('CUSTOMER', 'PROVIDER');

DROP TYPE IF EXISTS AccountStatus;
CREATE TYPE AccountStatus AS ENUM ('ACTIVE', 'SUSPENDED', 'DELETED');

CREATE TABLE "user" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password CHAR(64) NOT NULL,
    type UserType NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    status AccountStatus NOT NULL,
    verified BOOLEAN DEFAULT FALSE
);

COMMENT ON COLUMN "user".id IS 'ID único para o usuário, gerado automaticamente';
COMMENT ON COLUMN "user".created_at IS 'Data e hora da criação do usuário';
COMMENT ON COLUMN "user".updated_at IS 'Data e hora da última atualização do usuário';
COMMENT ON COLUMN "user".name IS 'Nome do usuário';
COMMENT ON COLUMN "user".email IS 'E-mail do usuário, deve ser único';
COMMENT ON COLUMN "user".password IS 'Senha do usuário';
COMMENT ON COLUMN "user".type IS 'Tipo de usuário, CUSTOMER ou PROVIDER';
COMMENT ON COLUMN "user".phone_number IS 'Número de telefone do usuário';
COMMENT ON COLUMN "user".address IS 'Endereço do usuário';
COMMENT ON COLUMN "user".status IS 'Status da conta do usuário, ACTIVE, SUSPENDED ou DELETED';
COMMENT ON COLUMN "user".verified IS 'Indica se a conta do usuário foi verificada';
