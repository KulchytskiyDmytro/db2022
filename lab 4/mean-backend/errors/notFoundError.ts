import { ApiError } from "./apiError";

export class NotFoundError extends ApiError {
  constructor(name: string, id: any) {
    super(`Not found such ${name} with id: ${id}`, 404);
  }
}
