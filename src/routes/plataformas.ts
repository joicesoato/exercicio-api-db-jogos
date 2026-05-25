import { Router } from "express";
import prisma from "../prisma";

const router = Router();

router.post("/", async (req, res) => {
  const { nome } = req.body;

  const plataforma = await prisma.plataforma.create({
    data: {
      nome,
    },
  });

  res.status(201).json(plataforma);
});

router.get("/", async (_, res) => {
  const plataformas = await prisma.plataforma.findMany({
    include: {
      jogos: {
        include: {
          jogo: true,
        },
      },
    },
  });

  res.json(plataformas);
});

export default router;