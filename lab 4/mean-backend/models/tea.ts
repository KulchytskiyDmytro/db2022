import mongoose from "mongoose";

export interface ITea {
  name: string;
  description: string;
  image: string;
  sort: string;
  leaves: string;
  price: number;
}

const TeaScheme = new mongoose.Schema(
  {
    name: { type: String, required: true },
    description: { type: String, required: true },
    image: { type: String, required: true },
    sort: {
      type: String,
      enum: ["White", "Green", "Dark", "Red"],
      default: "Dark",
      required: true,
    },
    leaves: {
      type: String,
      enum: ["Large", "Small"],
      default: "Large",
      required: true,
    },
    price: { type: Number, required: true },
  },
  {
    versionKey: false,
    collection: "Tea",
  }
);

const Tea = mongoose.model<ITea>("Tea", TeaScheme);

export { Tea };
