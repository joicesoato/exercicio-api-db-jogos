import { Router } from "express";
import prisma from "../prisma";

const router = Router();

router.post("/", async (req, res) => {
  const { titulo, idGenero } = req.body;

  const jogo = await prisma.jogo.create({
    data: {
      titulo,
      idGenero,
    },
  });

  res.status(201).json(jogo);
});

router.post("/:id/plataformas", async (req, res) => {
  const jogoId = Number(req.params.id);
  const { plataformaId } = req.body;

  const relacao = await prisma.jogoPlataforma.create({
    data: {
      jogoId,
      plataformaId,
    },
  });

  res.status(201).json(relacao);
});

router.get("/", async (_, res) => {
  const jogos = await prisma.jogo.findMany({
    include: {
      genero: true,
      plataformas: {
        include: {
          plataforma: true,
        },
      },
    },
  });

  res.json(jogos);
});

export default router;