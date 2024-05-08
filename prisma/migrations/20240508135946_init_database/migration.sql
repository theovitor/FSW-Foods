-- CreateTable
CREATE TABLE "Restaurante" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "imagemUrl" TEXT NOT NULL,
    "valorEntrega" DECIMAL(10,2) NOT NULL,
    "tempoEntrega" INTEGER NOT NULL,

    CONSTRAINT "Restaurante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "imagemUrl" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Produtos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "imagemUrl" TEXT NOT NULL,
    "preco" DECIMAL(10,2) NOT NULL,
    "porcDesc" INTEGER NOT NULL DEFAULT 0,
    "restauranteId" TEXT NOT NULL,
    "categoriaId" TEXT NOT NULL,

    CONSTRAINT "Produtos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoriaToRestaurante" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CategoriaToRestaurante_AB_unique" ON "_CategoriaToRestaurante"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoriaToRestaurante_B_index" ON "_CategoriaToRestaurante"("B");

-- AddForeignKey
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_restauranteId_fkey" FOREIGN KEY ("restauranteId") REFERENCES "Restaurante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Produtos" ADD CONSTRAINT "Produtos_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "Categoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoriaToRestaurante" ADD CONSTRAINT "_CategoriaToRestaurante_A_fkey" FOREIGN KEY ("A") REFERENCES "Categoria"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoriaToRestaurante" ADD CONSTRAINT "_CategoriaToRestaurante_B_fkey" FOREIGN KEY ("B") REFERENCES "Restaurante"("id") ON DELETE CASCADE ON UPDATE CASCADE;
