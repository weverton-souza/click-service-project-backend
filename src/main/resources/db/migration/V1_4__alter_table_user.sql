ALTER TABLE "user" ADD COLUMN address_id UUID;
COMMENT ON COLUMN "user".address_id IS 'UUID referenciando a tabela de endereços';
ALTER TABLE "user" ADD FOREIGN KEY (address_id) REFERENCES "address" (id);

ALTER TABLE "user" ADD COLUMN file_id UUID;
COMMENT ON COLUMN "user".file_id IS 'UUID referenciando a tabela de arquivos';
ALTER TABLE "user" ADD FOREIGN KEY (file_id) REFERENCES "file" (id);
