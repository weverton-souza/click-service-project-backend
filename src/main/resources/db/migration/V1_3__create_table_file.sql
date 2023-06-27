CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE FileType AS ENUM ('PHOTO', 'ADDRESS_PROOF', 'THUMB', 'RECEIPT');

CREATE TABLE "file" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    s3_url VARCHAR(255) NOT NULL,
    file_type FileType NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN "file".id IS 'ID único para o arquivo, gerado automaticamente';
COMMENT ON COLUMN "file".file_name IS 'Nome do arquivo';
COMMENT ON COLUMN "file".s3_url IS 'URL do arquivo armazenado no S3';
COMMENT ON COLUMN "file".file_type IS 'Tipo do arquivo, PHOTO, ADDRESS_PROOF, THUMB, ou RECEIPT';
COMMENT ON COLUMN "file".created_at IS 'Data e hora da criação do arquivo';
COMMENT ON COLUMN "file".updated_at IS 'Data e hora da última atualização do arquivo';
