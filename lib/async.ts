export const delay = (ms:number) => {
    return new Promise(resolve => setTimeout(() => resolve(1), ms));
}