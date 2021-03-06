import axios, {AxiosInstance, AxiosRequestConfig} from "axios";
import io from "socket.io-client";

class API {
  public readonly axios: AxiosInstance;
  public socket?: SocketIOClient.Socket;
  public networkError: any = false;
  private server = localStorage.getItem("server") ?? "http://localhost:8083";
  private token?: string;

  constructor() {
    this.axios = axios.create({
      baseURL: `${this.server}/api`
    });
    this.axios.interceptors.response.use(
      (response) => {
        const isoDatePattern = new RegExp(/\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d\.\d+([+-][0-2]\d:[0-5]\d|Z)/);
        this.networkError = false;
        return {
          ...response,
          data: JSON.parse(JSON.stringify(response.data), (key: string, value: unknown) =>
            typeof value === "string" && value.match(isoDatePattern) ? new Date(value) : value
          )
        };
      },
      (error) => {
        this.networkError = !error?.response ? error : false;
      }
    );
    this.setToken(localStorage.getItem("token") ?? "");
  }

  public getServer() {
    return this.server;
  }

  public setServer(server: string) {
    localStorage.setItem("server", server);
    this.server = server;
    this.axios.defaults.baseURL = this.server;
    this.socket?.close();
    this.socket = io(`${this.server}`, {
      query: {token: this.token}
    });
  }

  public setToken(token: string) {
    this.token = token;
    localStorage.setItem("token", token);
    this.socket?.close();
    this.socket = io(`${this.server}`, {
      query: {token}
    });
    this.axios.defaults.headers.common.Authorization = `Bearer ${token}`;
  }

  public clearToken() {
    localStorage.removeItem("token");
    this.socket?.close();
    this.socket = undefined;
    this.axios.defaults.headers.common.Authorization = ``;
  }

  public async get<M>(Class: any, url: string, config?: AxiosRequestConfig) {
    const {data} = await this.axios.get(url, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async delete<M>(Class: any, url: string, config?: AxiosRequestConfig) {
    const {data} = await this.axios.delete(url, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async head<M>(Class: any, url: string, config?: AxiosRequestConfig) {
    const {data} = await this.axios.head(url, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async options<M>(Class: any, url: string, config?: AxiosRequestConfig) {
    const {data} = await this.axios.options(url, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async post<M>(Class: any, url: string, datas?: any, config?: AxiosRequestConfig) {
    const {data} = await this.axios.post(url, datas, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async put<M>(Class: any, url: string, datas?: any, config?: AxiosRequestConfig) {
    const {data} = await this.axios.put(url, datas, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public async patch<M>(Class: any, url: string, datas?: any, config?: AxiosRequestConfig) {
    const {data} = await this.axios.patch(url, datas, config);
    return (Array.isArray(data) ? data.map((d) => new Class(d)) : new Class(data)) as M;
  }

  public getUrl(pathname: string): string {
    const url = new URL(this.server);
    url.pathname = pathname;
    return url.toString();
  }
}

export default new API();
