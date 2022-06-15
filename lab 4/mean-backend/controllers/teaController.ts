import { NextFunction, Request, Response } from "express";
import { BadRequestError } from "../errors/badRequestError";
import { NotFoundError } from "../errors/notFoundError";
import { ITea, Tea } from "../models/tea";
import { SuccessResult } from "../responses/SuccessResult";

export class TeaController {
  async CreateTea(req: Request, res: Response, next: NextFunction) {
    if (req?.body) {
      const { body } = req;

      var tea: ITea = {
        ...body,
      };

      Tea.insertMany([tea]).then((createdTea) => {
        SuccessResult.WithData(res, createdTea);
      });
      return;
    }
    return next(new BadRequestError("Please provide information about tea"));
  }

  async GetTea(id: string, req: Request, res: Response, next: NextFunction) {
    const tea = await Tea.findById(id);

    if (tea) {
      return SuccessResult.WithData(res, tea);
    }

    return next(new NotFoundError("Tea", id));
  }

  GetAllTea(res: Response) {
    Tea.find({}).then((tea) => {
      return SuccessResult.WithData(res, tea);
    });
  }

  async UpdateTea(id: string, req: Request, res: Response, next: NextFunction) {
    if (req?.body) {
      const { body } = req;

      const updateTea: ITea = {
        ...body,
      };

      await Tea.findByIdAndUpdate(id, updateTea);

      return SuccessResult.Empty(res, 204);
    }
    return next(new BadRequestError("Please provide information about tea"));
  }

  DeleteTea(id: string, res: Response) {
    Tea.findByIdAndDelete(id).then(() => {
      return SuccessResult.Empty(res, 204);
    });
  }
}
