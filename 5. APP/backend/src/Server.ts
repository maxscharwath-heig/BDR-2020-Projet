import "@tsed/platform-express";
import "@tsed/socketio";
import "@tsed/swagger";
import "@tsed/passport";

import bodyParser from "body-parser";
import compress from "compression";
import cookieParser from "cookie-parser";
import methodOverride from "method-override";
import cors from "cors";

import {Configuration, Inject} from "@tsed/di";
import {PlatformApplication} from "@tsed/common";

import * as dotenv from "dotenv";

export const rootDir = __dirname;
dotenv.config();

@Configuration({
  rootDir,
  acceptMimes: ["application/json"],
  httpPort: process.env.SERVER_PORT || 8083,
  httpsPort: false,
  logger: {
    logRequest: Boolean(Number(process.env.SERVER_LOGS))
  },
  mount: {
    "/api": [
      `${rootDir}/controllers/root/**/*.ts`
    ],
    "/api/my": [
      `${rootDir}/controllers/my/**/*.ts`
    ]
  },
  componentsScan: [
    `${rootDir}/protocols/*{.ts,.js}`,
    `${rootDir}/services/*{.ts,.js}`,
    `${rootDir}/middlewares/*{.ts,.js}`
  ],
  passport: {},
  swagger: [
    {
      path: "/docs",
      specVersion: "3.0.1"
    }
  ],
  statics: {
    "/statics": [
      {
        root: `${rootDir}/public`
      }
    ]
  },
  multer: {
    dest: `${rootDir}/storage/tmp`
  },
  exclude: [
    "**/*.spec.ts"
  ]
})
export class Server {
  @Inject()
  app: PlatformApplication;

  @Configuration()
  settings: Configuration;

  $beforeRoutesInit(): void {
    this.app
      .use(cors())
      .use(cookieParser())
      .use(compress({}))
      .use(methodOverride())
      .use(bodyParser.json())
      .use(bodyParser.urlencoded({
        extended: true
      }));
  }
}
