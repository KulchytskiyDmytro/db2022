import express from "express";
import { TeaController } from "../controllers/teaController";

const router = express.Router();
const baseEndpoint = "/tea";

const teaController = new TeaController();

// Create
router.post(baseEndpoint, async (req, res, next) => {
  await teaController.CreateTea(req, res, next);
});

// Get One
router.get(`${baseEndpoint}/:id`, async (req, res, next) => {
  await teaController.GetTea(req.params.id, req, res, next);
});

// Get All
router.get(baseEndpoint, (req, res) => {
  teaController.GetAllTea(res);
});

// Update
router.put(`${baseEndpoint}/:id`, async (req, res, next) => {
  await teaController.UpdateTea(req.params.id, req, res, next);
});

// Delete
router.delete(`${baseEndpoint}/:id`, (req, res) => {
  teaController.DeleteTea(req.params.id, res);
});

export { router as TeaRouter };
