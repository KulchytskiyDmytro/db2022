import { NextFunction, Request, Response } from "express";
import { ApiError } from "../errors/apiError";
import { InternalServerError } from "../errors/internalServerError";
import { ErrorResult } from "../responses/ErrorResult";

export function HandleErrors(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (err instanceof ApiError) {
    console.log(`API ERROR: ${err.message}`);
    return res.status(err.status).json(ErrorResult.Message(err.message));
  }
  console.log(`FATAL ERROR: ${err.message}`);
  return res.status(500).json(new InternalServerError());
}
