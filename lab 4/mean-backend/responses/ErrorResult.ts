export class ErrorResult {
  public message?: string;

  static Message(message: string): ErrorResult {
    return {
      message: message,
    };
  }
}
