import Command from "@oclif/command";
export declare const sanitizeGitRemote: (remote?: string | undefined) => any;
export interface Commit {
    authorName: string | null;
    authorEmail: string | null;
}
export interface GitContext {
    committer?: string;
    commit?: string;
    message?: string;
    remoteUrl?: string;
    branch?: string;
}
export declare const gitInfo: (log: Command["log"]) => Promise<GitContext | undefined>;
//# sourceMappingURL=git.d.ts.map