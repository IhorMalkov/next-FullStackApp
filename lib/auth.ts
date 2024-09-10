import bcrypt from 'bcrypt';
import { SignJWT, jwtVerify} from "jose";
import { db } from "./db";

export const hashedPassword = (password: string) => {
    return bcrypt.hash(password, 10);
}
const comparePassword = (password: string, hashedPassword: string) => {
    return bcrypt.compare(password, hashedPassword);
}

export const createJWT = (user: SignJWT) => {
    const iat = Math.floor(Date.now() / 1000);
    const exp = iat + 60 * 60 * 24 * 7;

    return new SignJWT({payload: {id: user.id, email: user.email}})
        .setProtectedHeader({alg: 'HS256', type: 'JWT'})
        .setExpirationTime(exp)
        .setIssuedAt(iat)
        .setNotBefore(iat)
        .sign(new TextEncoder().encode(process.env.JWT_SECRET));
}

export const verifyJWT = async (jwt) => {
    const { payload } = await jwt.verify(
        jwt,
        new TextEncoder().encode(process.env.JWT_SECRET)
    );

    return payload.payload as any;
}

export const getUserFromCookies = (cookies) => {
    const jwt = cookies.get(process.env.COOKIE_NAME);

    const id = await jwt.verify(jwt);

    const user = await db.user.findUnique(
        {
            where: {
                id
            }
        }
    )

    return user;
}