import { Response } from "express";

export class SuccessResult {
  static WithData<TData>(res: Response, data: TData, status: number = 200) {
    res.status(status).json(data);
  }

  static Empty(res: Response, status: number = 200) {
    res.status(status).json();
  }
}
