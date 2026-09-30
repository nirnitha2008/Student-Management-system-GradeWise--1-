import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { GraduationCap, Lock, Mail } from "lucide-react";
import { getSession, signIn } from "@/lib/auth";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "GradeWise Login — Attendance & Performance Tracker" },
      {
        name: "description",
        content:
          "Sign in to GradeWise to track attendance, assignments, study plans and academic performance in one campus portal.",
      },
      { property: "og:title", content: "GradeWise Login — Attendance & Performance Tracker" },
      {
        property: "og:description",
        content: "Sign in to GradeWise to track attendance, assignments, study plans and academic performance in one campus portal.",
      },
    ],
  }),
  component: LoginPage,
});

function LoginPage() {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  useEffect(() => {
    if (getSession()) navigate({ to: "/dashboard", replace: true });
  }, [navigate]);

  return (
    <div className="page-canvas flex min-h-screen items-center justify-center px-4 py-12">
      <div className="w-full max-w-md">
        <div className="mb-7 text-center">
          <div className="mx-auto mb-4 flex size-14 items-center justify-center rounded-2xl bg-primary text-primary-foreground shadow-float">
            <GraduationCap className="size-7" />
          </div>
          <h1 className="text-3xl font-semibold">GradeWise</h1>
          <p className="mt-2 text-sm text-muted-foreground">
            Academic Attendance &amp; Performance Tracker
          </p>
        </div>

        <form
          onSubmit={(e) => {
            e.preventDefault();
            signIn(email);
            navigate({ to: "/dashboard" });
          }}
          className="surface-card space-y-4 p-7"
        >
          <div className="space-y-1.5">
            <label htmlFor="email" className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
              Email
            </label>
            <div className="flex items-center gap-2 rounded-lg border border-border bg-background px-3 py-2.5">
              <Mail className="size-4 text-muted-foreground" />
              <input
                id="email"
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="you@college.edu"
                className="w-full bg-transparent text-sm outline-none"
              />
            </div>
          </div>

          <div className="space-y-1.5">
            <label htmlFor="password" className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
              Password
            </label>
            <div className="flex items-center gap-2 rounded-lg border border-border bg-background px-3 py-2.5">
              <Lock className="size-4 text-muted-foreground" />
              <input
                id="password"
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="••••••••"
                className="w-full bg-transparent text-sm outline-none"
              />
            </div>
          </div>

          <button
            type="submit"
            className="w-full rounded-lg bg-primary py-3 text-sm font-bold text-primary-foreground transition-transform hover:-translate-y-0.5"
          >
            Login
          </button>

          <p className="text-center text-xs text-muted-foreground">
            Don&apos;t have an account?{" "}
            <Link to="/register" className="font-bold text-primary">
              Register
            </Link>
