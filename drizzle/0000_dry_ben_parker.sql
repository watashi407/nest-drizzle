CREATE TABLE "comments_nest" (
	"id" serial PRIMARY KEY NOT NULL,
	"text" text NOT NULL,
	"authorId" integer NOT NULL,
	"postId" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "groups_nest" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "usersToGroups_nest" (
	"userId" integer,
	"groupId" integer,
	CONSTRAINT "usersToGroups_nest_groupId_userId_pk" PRIMARY KEY("groupId","userId")
);
--> statement-breakpoint
CREATE TABLE "posts_nest" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" text NOT NULL,
	"content" text NOT NULL,
	"authorId" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "profileInfo_nest" (
	"id" serial PRIMARY KEY NOT NULL,
	"metadata" jsonb,
	"userId" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "users_nest" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL
);
--> statement-breakpoint
ALTER TABLE "comments_nest" ADD CONSTRAINT "comments_nest_authorId_users_nest_id_fk" FOREIGN KEY ("authorId") REFERENCES "public"."users_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comments_nest" ADD CONSTRAINT "comments_nest_postId_posts_nest_id_fk" FOREIGN KEY ("postId") REFERENCES "public"."posts_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "usersToGroups_nest" ADD CONSTRAINT "usersToGroups_nest_userId_users_nest_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "usersToGroups_nest" ADD CONSTRAINT "usersToGroups_nest_groupId_groups_nest_id_fk" FOREIGN KEY ("groupId") REFERENCES "public"."groups_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts_nest" ADD CONSTRAINT "posts_nest_authorId_users_nest_id_fk" FOREIGN KEY ("authorId") REFERENCES "public"."users_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "profileInfo_nest" ADD CONSTRAINT "profileInfo_nest_userId_users_nest_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users_nest"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "userIdIndex" ON "usersToGroups_nest" USING btree ("userId");--> statement-breakpoint
CREATE INDEX "idIndex" ON "users_nest" USING btree ("id");