const express = require("express");
const app = express();
const client = require("prom-client");

// tự động thu thập số liệu như cpu, ram, event loop
client.collectDefaultMetrics();

// kiểm tra trạng thái hoạt động của ứng dụng
app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok", version: "2.0.0" });
});

// endpoint cung cấp số liệu giám sát cho prometheus
app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

// trạng thái ứng dụng
app.get("/", (req, res) => {
  res.send("Xin chào! Ứng dụng CI/CD Demo đang hoạt động ổn định trên Kubernetes.");
});

module.exports = app;
