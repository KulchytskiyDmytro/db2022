import { ApiError } from "./apiError";

export class InternalServerError extends ApiError {
  constructor() {
    super("Internal Server Error", 500);
  }
}
