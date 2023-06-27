ALTER TABLE "file" ADD COLUMN file_id UUID;
COMMENT ON COLUMN "file".file_id IS 'UUID referenciando a própria tabela de arquivos, usado para relacionar registros dentro da mesma tabela';
ALTER TABLE "file" ADD FOREIGN KEY (file_id) REFERENCES "file" (id);
