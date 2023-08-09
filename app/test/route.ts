import { NextResponse } from "next/server";

export const dynamic = 'force-dynamic';

export function GET() {
  return NextResponse.json({ test: process.env.NEXT_TEST });
}